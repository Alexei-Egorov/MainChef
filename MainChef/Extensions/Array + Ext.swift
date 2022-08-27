extension Sequence where Iterator.Element: DomainConvertableType {
    typealias DomainObject = Iterator.Element
    func mapToDomain() -> [DomainObject.DomainType] {
        return map {
            return $0.asDomain()
        }
    }
}

extension Sequence where Iterator.Element: RealmDataConvertableType {
    typealias RealmObject = Iterator.Element
    func mapToRealm() -> [RealmObject.DomainType] {
        return map {
            return $0.asRealmData()
        }
    }
}
