//
//  Protocol.swift
//  MemorizeDII
//
//  Created by Peerawat Poombua on 7/10/25.
//

import Foundation

protocol Flyable {
    func fly() -> String
}

struct GreenDuck: Flyable {
    var name: String

    func fly() -> String {
        return "\(name) is flying"
    }
}

struct RedDuck: Flyable {
    var name: String

    func fly() -> String {
        return "\(name) is flying"
    }
}

func makeItFly(flyable: Flyable) {
    print(flyable.fly())
}


struct Data {
    var data: String = "hello"
}

struct Postgres {
    func query() -> [Data] {
        return [Data()]
    }

    func store(d: Data) {

    }
}

struct Cache {
    func getCache() -> [Data] {
        // perform cache look up
        return [Data()]
    }
}

struct MongoDB {
    func find() -> [Data] {
        return [Data()]
    }

    func create(d: Data) {

    }
}

//protocol DAO {
//    func getData() -> [Data]
//    func saveData(data: Data) -> Void
//}


protocol QueryDAO {
    func getData() -> [Data]
}

protocol StoreDAO {
    func saveData(data: Data) -> Void
}

struct PostgresDAO: QueryDAO, StoreDAO {
    var db = Postgres()
    
    func getData() -> [Data] {
        return db.query()
    }

    func saveData(data: Data) {
        db.store(d: data)
    }
}

struct MongoDAO: QueryDAO, StoreDAO {
    var db = MongoDB()
    
    func getData() -> [Data] {
        return db.find()
    }

    func saveData(data: Data) {
        db.create(d: data)
    }
}

struct CacheDAO: QueryDAO {
    var cache = Cache()
    var storeDAO: StoreDAO

    func getData() -> [Data] {
        // get cache before hit database
        return cache.getCache()
    }
}

struct Service {
    var queryDAO: QueryDAO
    var storeDAO: StoreDAO

    func printData() {
        print(queryDAO.getData())
    }
}

func makeService() -> Service {
    return Service(
        queryDAO: CacheDAO(storeDAO: PostgresDAO()),
        storeDAO: PostgresDAO()
    )
}


func main() {
    makeItFly(flyable: GreenDuck(name: "Green"))
    makeItFly(flyable: RedDuck(name: "Red"))

//    Service().printData()
}
