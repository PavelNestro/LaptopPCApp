import RealmSwift
import UIKit
import Foundation

class User: Object {
    @Persisted var name: String = ""
    @Persisted var devices = List<Device>()
}

class Device: Object {
    @Persisted(primaryKey: true) var id: String = UUID().uuidString
    @Persisted var type: String = ""
    @Persisted var deviceName: String = ""
    @Persisted var deviceModel: String?
    @Persisted var releaseDate: Date?
    @Persisted var deviceNumber: String?
    @Persisted var characteristics = ""
    @Persisted var imageDeviceData: Data?
    @Persisted var serviceDays = 365
    @Persisted var cleanDays = 5
    @Persisted var memoryCleaningDays = 5
    @Persisted var note = ""
    @Persisted var lastCheckServiceInDate = Date()
    @Persisted var lastCheckCleanInDate = Date()
    @Persisted var lastCheckMemoryCleanInDate = Date()
}

class RealmManager {
    
    static let shared = RealmManager()
    
    private let realm: Realm
    
    private init() {
        let config = Realm.Configuration(
            schemaVersion: 6,
            migrationBlock: { migration, oldSchemaVersion in
                if oldSchemaVersion < 1 {
                }
            }
        )
        Realm.Configuration.defaultConfiguration = config

        do {
            realm = try Realm()
        } catch {
            fatalError("Unable to initialize Realm: \(error.localizedDescription)")
        }
    }
    
    // MARK: - User Methods
    
    func saveUser(_ user: User) {
        do {
            try realm.write {
                realm.add(user)
            }
        } catch {
            print("Error saving user: \(error.localizedDescription)")
        }
    }
    
    func getUser() -> User? {
        return realm.objects(User.self).first
    }
    
    func updateUser(_ user: User, withName name: String) {
        do {
            try realm.write {
                user.name = name
            }
        } catch {
            print("Error updating user: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Device Methods
    
    func saveDevice(_ device: Device, to user: User) {
        do {
            try realm.write {
                user.devices.append(device)
            }
        } catch {
            print("Error saving device: \(error.localizedDescription)")
        }
    }
    
    func getDevices(for user: User) -> List<Device> {
        return user.devices
    }
    
    func getDevice(by id: String) -> Device? {
        return realm.object(ofType: Device.self, forPrimaryKey: id)
    }
    
    func updateDevice(_ device: Device, withValues values: [String: Any]) {
        do {
            try realm.write {
                for (key, value) in values {
                    device.setValue(value, forKey: key)
                }
            }
        } catch {
            print("Error updating device: \(error.localizedDescription)")
        }
    }
    
    func deleteDevice(_ device: Device) {
        do {
            try realm.write {
                realm.delete(device)
            }
        } catch {
            print("Error deleting device: \(error.localizedDescription)")
        }
    }
    
    // MARK: - General Methods
    
    func deleteAll() {
        do {
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            print("Error deleting all objects: \(error.localizedDescription)")
        }
    }
}
