
import UIKit


struct SearchedArticlesCellViewModel: ArticleListCellViewModel {
    var dateString: String
    var titleString: String
    
    init(model: SearchDocModel) {
        let date = model.pubDate?.components(separatedBy: "T").first
        titleString = model.abstract ?? ""
        dateString = date?.getformattedDate() ?? ""
    }
}


struct MostViewedCellViewModel: ArticleListCellViewModel {
    var dateString: String
    var titleString: String
    
    init(model: MostViewedResultModel) {
        titleString = model.abstract ?? ""
        dateString = model.publishedDate?.getformattedDate() ?? ""
    }
}


struct MostSharedCellViewModel: ArticleListCellViewModel {
    var dateString: String
    var titleString: String
    
    init(model: MostSharedResultModel) {
        titleString = model.abstract ?? ""
        dateString = model.publishedDate?.getformattedDate() ?? ""
    }
}


struct MostEmailedCellViewModel: ArticleListCellViewModel {
    var dateString: String
    var titleString: String
    
    init(model: MostEmailedResultModel) {
        titleString = model.abstract ?? ""
        dateString = model.publishedDate?.getformattedDate() ?? ""
    }
}


