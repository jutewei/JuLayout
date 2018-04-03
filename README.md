比masonry还简洁的autolayout约束封装，让约束像写frame一样方便，调用非常简单，可完成100%的约束。新版本中添加安全区域的约束，只需约束是加.safe即可，安全区域约束只有上下左右可添加

例：
UIView *vie=[[UIView alloc]init];

[self.view addSubview:vie];

vie.juFrame(CGRectMake(10, 10, 100, 100));

或

vie.juEdge(UIEdgeInsetsMake(0, 0, 0, 0));

或

vie.juLead.equal(10);

vie.juTrail.equal(10);

vie.juWidth.equal(100);

vie.juHeight.equal(100);

1、单一约束设置

/**  左边约束*/
 
-(JuLayout *)juLead;

/**  右边约束*/
 
-(JuLayout *)juTrail;

/**  底端约束*/
 
-(JuLayout *)juTop;

/**  底端约束*/
 
-(JuLayout *)juBottom;

/** 约束者的左边相对于约束对象右边（space）*/
 
-(JuLayout *)juLeftSpace;

/**  约束者的右边相对于约束对象左边（space）*/
 
-(JuLayout *)juRighSpace;

/***  约束者的顶端边相对于约束对象底端（space） */
 
-(JuLayout *)juTopSpace;

/**  约束者的底端边相对于约束对象顶端（space）*/
 
-(JuLayout *)juBomSpace;

/** 底端文本对齐*/
 
-(JuLayout *)juLastLine;

/**  顶端文本对齐*/
 
-(JuLayout *)juFirstLine;

/**  X轴对齐*/
 
-(JuLayout *)juCenterX;

/** Y轴对齐*/
 
-(JuLayout *)juCenterY;

/** 宽度（默认为父View时，0时等于父view宽度，>0时为自己实际宽度）*/
 
-(JuLayout *)juWidth;

/** 高度（默认为父View时，0时等于父view宽度，>0时为自己实际高度）*/
 
-(JuLayout *)juHeight;

/**  像素宽高比(W/H)Pixel Aspect Ratio Par*/
 
-(JuLayout *)juAspectWH;





2、日常常用的组合约束

**  XY坐标等于另一个view*/
 
-(void(^)(UIView *view))juOriginEqual;

/** 宽度高度坐标等于另一个view*/
 
-(void(^)(UIView *view))juSizeEqual;

/**  整个约束等于另一个View（一般是等于父view）*/
 
-(void(^)(UIView *view))juFrameEqual;

/**  XY约束:X（>0左边,<0右边，=0中间）,Y（>0顶端,<0底端，=0中间）*/
 
-(void(^)(CGPoint origin))juOrigin;

/**  宽度高度*/
 
-(void(^)(CGSize size))juSize;

/** frame约束（xy等同juOrigin）*/
 
-(void(^)(CGRect frame))juFrame;

/**  四边约束*/
 
-(void(^)(UIEdgeInsets edge))juEdge;
-(void(^)(UIEdgeInsets edge,UIView *view))juEdgeTo;

/**  左,右 ,Y方向（>0顶端,<0底端，=0中间）,高度约束*/
 
-(void(^)(JuLayEdgeHeight juEdgeH))juEdgeH;
-(void(^)(JuLayEdgeHeight juEdgeH,UIView *view))juEdgeHTo;

/**  上,下, X方向（>0坐边,<0右边，=0中间）,高度约束*/
 
-(void(^)(JuLayEdgeWidth juEdgeW))juEdgeW;
-(void(^)(JuLayEdgeWidth juEdgeW,UIView *view))juEdgeWTo;



