.class Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;
.super Ljava/lang/Object;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ViewTree"
.end annotation


# static fields
.field private static final INSERT_AT_END_INDEX:I = -0x1


# instance fields
.field private mChildren:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;",
            ">;"
        }
    .end annotation
.end field

.field private mRoot:Landroid/view/View;


# direct methods
.method private constructor <init>(Landroid/view/View;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->mRoot:Landroid/view/View;

    return-void
.end method

.method synthetic constructor <init>(Landroid/view/View;Lcom/zte/toolsdk/widget/z;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;-><init>(Landroid/view/View;)V

    return-void
.end method

.method static bridge synthetic a(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->mChildren:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method private addViewChild(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->isRootNamespace()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;

    .line 15
    .line 16
    invoke-direct {v0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;-><init>(Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->mChildren:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-object p0, v0

    .line 25
    :cond_1
    instance-of v0, p1, Landroid/view/ViewGroup;

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->mChildren:Ljava/util/ArrayList;

    .line 30
    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    new-instance v0, Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->mChildren:Ljava/util/ArrayList;

    .line 39
    .line 40
    check-cast p1, Landroid/view/ViewGroup;

    .line 41
    .line 42
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    const/4 v1, 0x0

    .line 47
    :goto_0
    if-ge v1, v0, :cond_2

    .line 48
    .line 49
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-direct {p0, v2}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->addViewChild(Landroid/view/View;)V

    .line 54
    .line 55
    .line 56
    add-int/lit8 v1, v1, 0x1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_2
    :goto_1
    return-void
.end method

.method static bridge synthetic b(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->mRoot:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->mChildren:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public addChild(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)V
    .locals 1

    const/4 v0, -0x1

    .line 1
    invoke-virtual {p0, p1, v0}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->addChild(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;I)V

    return-void
.end method

.method public addChild(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;I)V
    .locals 1

    .line 2
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->mChildren:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->mChildren:Ljava/util/ArrayList;

    .line 4
    :cond_0
    invoke-virtual {p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->createTree()V

    const/4 v0, -0x1

    if-ne p2, v0, :cond_1

    .line 5
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    .line 6
    :cond_1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {p0, p2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    return-void
.end method

.method public createTree()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->mChildren:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->mChildren:Ljava/util/ArrayList;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->mRoot:Landroid/view/View;

    .line 14
    .line 15
    instance-of v1, v0, Landroid/view/ViewGroup;

    .line 16
    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    check-cast v0, Landroid/view/ViewGroup;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    const/4 v2, 0x0

    .line 26
    :goto_0
    if-ge v2, v1, :cond_1

    .line 27
    .line 28
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-direct {p0, v3}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->addViewChild(Landroid/view/View;)V

    .line 33
    .line 34
    .line 35
    add-int/lit8 v2, v2, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    :goto_1
    return-void
.end method

.method public findChildIndex(ILjava/util/function/Predicate;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/function/Predicate<",
            "Landroid/view/View;",
            ">;)I"
        }
    .end annotation

    .line 2
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->mChildren:Ljava/util/ArrayList;

    const/4 v1, -0x1

    if-nez v0, :cond_0

    return v1

    .line 3
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_2

    .line 4
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;

    iget-object v0, v0, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->mRoot:Landroid/view/View;

    invoke-interface {p2, v0}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    return p1

    :cond_1
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_2
    return v1
.end method

.method public findChildIndex(Ljava/util/function/Predicate;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Predicate<",
            "Landroid/view/View;",
            ">;)I"
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, v0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->findChildIndex(ILjava/util/function/Predicate;)I

    move-result p0

    return p0
.end method

.method public findViewById(I)Landroid/view/View;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(I)TT;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->mChildren:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->mRoot:Landroid/view/View;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->findViewTreeById(I)Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-nez p0, :cond_1

    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return-object p0

    .line 20
    :cond_1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->mRoot:Landroid/view/View;

    .line 21
    .line 22
    return-object p0
.end method

.method public findViewTreeById(I)Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->mRoot:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getId()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ne v0, p1, :cond_0

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->mChildren:Ljava/util/ArrayList;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    if-nez p0, :cond_1

    .line 14
    .line 15
    return-object v0

    .line 16
    :cond_1
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    :cond_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_3

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;

    .line 31
    .line 32
    invoke-virtual {v1, p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->findViewTreeById(I)Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    return-object v1

    .line 39
    :cond_3
    return-object v0
.end method

.method public findViewTreeParentOf(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->mChildren:Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return-object v1

    .line 7
    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-eqz v2, :cond_3

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;

    .line 22
    .line 23
    if-ne v2, p1, :cond_2

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_2
    invoke-virtual {v2, p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->findViewTreeParentOf(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    if-eqz v2, :cond_1

    .line 31
    .line 32
    return-object v2

    .line 33
    :cond_3
    return-object v1
.end method

.method public removeChildren(II)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->mChildren:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    :goto_0
    if-ge v0, p2, :cond_0

    .line 7
    .line 8
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->mChildren:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    add-int/lit8 v0, v0, 0x1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    return-void
.end method

.method public replaceView(Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->mRoot:Landroid/view/View;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->mChildren:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->createTree()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
