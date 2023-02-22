//
//  AppDelegate+Dependencies.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 22/11/22.
//

import Foundation
import Resolver

extension Resolver : ResolverRegistering {
    
    public static func registerAllServices() {
        registerRepositories()
        registerViewModels()
        registerChat()
        registerSearch()
        registerProductDetail()
        registerAccount()
    }
    
    private static func registerRepositories() {
        register {
            NotificationsRepository() as NotificationsRepositoryProtocol
           // ChatRepository() as ChatRepositoryProtocol
        }
        
        
    }
    
    private static func registerChat() {
        register {
            ChatRepository() as ChatRepositoryProtocol
        }
    }
    
    private static func registerSearch() {
        register {
            SearchRepository() as SearchRepositoryProtocol
        }
    }
    
    private static func registerProductDetail(){
        register {
            ProductsDetailRepo() as ProductsDetailRepoProtocol
        }
    }
    
    private static func registerAccount(){
        register {
            AccountRepo() as AccountRepoProtocol
        }
    }
    
    private static func registerViewModels() {
        register {
           // MainViewModel()
        }
        register {
            NotificationViewModel()
            
        }
        register {
           ChatViewModel()
        }
        register {
            SearchViewModel()
        }
        register {
            ProductDetailViewModel()
        }
        register {
            ProductByCategoryViewModel()
        }
        register {
            CategoryViewModel()
        }
        register {
            CategoryProductPostViewModel()
        }
        register {
            AccountViewModel()
        }
        
    }
}

