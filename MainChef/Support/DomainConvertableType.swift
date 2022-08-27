protocol DomainConvertableType {
    associatedtype DomainType
    func asDomain() -> DomainType
}
