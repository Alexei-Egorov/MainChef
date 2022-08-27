import UIKit
import RxSwift
import RxCocoa


class IngredientTextField: UITextField {
//    let disposeBag = DisposeBag()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        commonInit()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        commonInit()
//    }
//
//    func commonInit() {
////        rx.controlEvent([.editingDidBegin,.editingDidEnd])
////            .subscribe(onNext: { [unowned self] in
////                self.fieldState = .normal
////            })
////            .disposed(by: disposeBag)
////
////        rx.text.changed.subscribe{ [weak self] text in
////            guard let sSelf = self, let text = sSelf.text else { return }
////            sSelf.text = text.uppercased()
////        }.disposed(by: disposeBag)
//    }
//
//    public func setup(){
//
//        let pickerView = UIPickerView(frame: .zero)
//        setup(pickerView: pickerView, with: ingredients)
//        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
//        setup(toolBar: toolBar, of: pickerView)
//        inputAccessoryView = toolBar
//        collectionView.inputView = pickerView
//    }
//
//    private func setup(pickerView: UIPickerView, with items: [String]) {
//        Observable.just(items)
//            .bind(to: pickerView.rx.itemTitles) { _, item in
//                return item
//            }
//            .disposed(by: disposeBag)
//
//        pickerView.rx.modelSelected(String.self)
//            .subscribe(onNext: { [weak self] items in
//                guard let item = items.first, let sSelf = self else { return }
//                self?.selectedItem = item
//                print("jopta selectedItem: \(item)")
//            })
//            .disposed(by: disposeBag)
//    }
//
//    private func setup(toolBar: UIToolbar, of pickerView: UIPickerView) {
//        toolBar.barStyle = .default
//        toolBar.isTranslucent = true
//        toolBar.tintColor = .black
//
//        let doneButton = UIButton(frame: .zero)
//        doneButton.setTitle("Done", for: .normal)
//        doneButton.setTitleColor(.blue, for: .normal)
//        doneButton.rx.tap
//            .subscribe(onNext: { [weak self] in
//                guard let sSelf = self else { return }
//                let row = pickerView.selectedRow(inComponent: 0)
//                self?.selectedIngredients.append(sSelf.ingredients[row])
//                self?.collectionView.reloadData()
//            }).disposed(by: disposeBag)
//
//        let cancelButton = UIButton(frame: .zero)
//        cancelButton.setTitle("Clear", for: .normal)
//        cancelButton.setTitleColor(.blue, for: .normal)
//        cancelButton.rx.tap
//            .subscribe(onNext: {
//
//            }).disposed(by: disposeBag)
//
//        let doneBarButton = UIBarButtonItem(customView: doneButton)
//        let clearBarButton = UIBarButtonItem(customView: cancelButton)
//        let spaceBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//        toolBar.setItems([clearBarButton, spaceBarButton, doneBarButton], animated: false)
//        toolBar.isUserInteractionEnabled = true
//    }
}
