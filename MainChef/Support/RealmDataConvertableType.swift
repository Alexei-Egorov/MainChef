protocol RealmDataConvertableType {
    associatedtype DomainType
    func asRealmData() -> DomainType
}
