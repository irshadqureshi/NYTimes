import UIKit


struct DashboardCellViewModel: HomeCellViewModel {
    var titleString: String
    
    init(indexPath: IndexPath) {
        titleString = indexPath.section == 0 ? ArticleType.searchArticles.rawValue : indexPath.row == 0 ? ArticleType.mostViewed.rawValue : indexPath.row == 1 ? ArticleType.mostShared.rawValue : ArticleType.mostEmailed.rawValue
    }
}



struct DashboardSectionCellViewModel: HomeSectionCellViewModel {
    var titleString: String
    
    init(section: Int) {
        titleString = section == 0 ? "Search" : "Popular"
    }
}
