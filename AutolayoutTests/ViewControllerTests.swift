//
//  ViewControllerTests.swift
//  AutolayoutTests
//
//  Created by Sergiu on 07.09.2021.
//  Copyright © 2021 Sergiu. All rights reserved.
//

import XCTest
@testable import Autolayout

class ViewControllerTests: XCTestCase {
    
    func test_viewDidLoad() {
        XCTAssertNotNil(makeSUT(), "viewDidLoad")
    }
    
    func test_outlets_shoulBeConnected() {
        XCTAssertNotNil(makeSUT().showLabel, "showLabel")
        XCTAssertNotNil(makeSUT().watchLabel, "watchLabel")
        XCTAssertNotNil(makeSUT().addTextFied, "addTextFied")
        XCTAssertNotNil(makeSUT().showStackView, "showStackView")
        XCTAssertNotNil(makeSUT().staticShowLabel, "staticShowLabel")
        XCTAssertNotNil(makeSUT().suggestRestaurantStackView, "sugestRestaurantStackView")
        XCTAssertNotNil(makeSUT().addRestaurantStackView, "addRestaurantStackView")
    }
    
    func test_buttons_tapping_shouldTape() {
        XCTAssertNotNil(tap(makeSUT().addButton))
        XCTAssertNotNil(tap(makeSUT().suggestButton))
    }
    
    //MAR:- Helpers
    private func makeSUT() -> ViewController {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut: ViewController = sb.instantiateViewController(identifier: String(describing: ViewController.self))
        sut.loadViewIfNeeded()
        return sut
    }
}
