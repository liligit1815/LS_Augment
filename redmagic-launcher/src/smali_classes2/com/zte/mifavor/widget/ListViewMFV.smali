.class public Lcom/zte/mifavor/widget/ListViewMFV;
.super Landroid/widget/ListView;
.source "ListViewMFV.java"


# annotations
.annotation runtime Landroid/widget/RemoteViews$RemoteView;
.end annotation


# static fields
.field private static final SCROLL_RATIO:F = 0.45f

.field private static final TAG:Ljava/lang/String; = "ListViewMFV"


# instance fields
.field private mEdgeGlowBottom:Landroid/widget/EdgeEffect;

.field private mEdgeGlowTop:Landroid/widget/EdgeEffect;

.field private mHasMfvFrameworkMod:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/ListViewMFV;->mHasMfvFrameworkMod:Z

    .line 3
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/ListViewMFV;->initListViewMFV()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 4
    invoke-direct {p0, p1, p2}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/ListViewMFV;->mHasMfvFrameworkMod:Z

    .line 6
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/ListViewMFV;->initListViewMFV()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/ListViewMFV;->mHasMfvFrameworkMod:Z

    .line 9
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/ListViewMFV;->initListViewMFV()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/ListViewMFV;->mHasMfvFrameworkMod:Z

    .line 12
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/ListViewMFV;->initListViewMFV()V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/ListViewMFV;->mHasMfvFrameworkMod:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/zte/mifavor/widget/ListViewMFV;->mEdgeGlowTop:Landroid/widget/EdgeEffect;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->finish()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/ListViewMFV;->mEdgeGlowBottom:Landroid/widget/EdgeEffect;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->finish()V

    .line 17
    .line 18
    .line 19
    :cond_1
    invoke-super {p0, p1}, Landroid/widget/ListView;->draw(Landroid/graphics/Canvas;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public initListViewMFV()V
    .locals 0

    .line 1
    return-void
.end method

.method protected overScrollBy(IIIIIIIIZ)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/ListViewMFV;->mHasMfvFrameworkMod:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    int-to-float v0, p2

    .line 6
    const v1, 0x3ee66666    # 0.45f

    .line 7
    .line 8
    .line 9
    mul-float/2addr v0, v1

    .line 10
    float-to-int v0, v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    move p2, v0

    .line 14
    :cond_0
    invoke-super/range {p0 .. p9}, Landroid/widget/ListView;->overScrollBy(IIIIIIIIZ)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public setOverScrollMode(I)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/widget/ListView;->setOverScrollMode(I)V

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p0, Lcom/zte/mifavor/widget/ListViewMFV;->mHasMfvFrameworkMod:Z

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    :try_start_0
    const-class p1, Landroid/widget/AbsListView;

    .line 9
    .line 10
    const-string v0, "mEdgeGlowTop"

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Landroid/widget/EdgeEffect;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/zte/mifavor/widget/ListViewMFV;->mEdgeGlowTop:Landroid/widget/EdgeEffect;

    .line 27
    .line 28
    const-string v0, "mEdgeGlowBottom"

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    check-cast p1, Landroid/widget/EdgeEffect;

    .line 42
    .line 43
    iput-object p1, p0, Lcom/zte/mifavor/widget/ListViewMFV;->mEdgeGlowBottom:Landroid/widget/EdgeEffect;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .line 45
    return-void

    .line 46
    :catch_0
    move-exception p0

    .line 47
    new-instance p1, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .line 51
    .line 52
    const-string v0, "setOverScrollMode e = "

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    const-string p1, "ListViewMFV"

    .line 65
    .line 66
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    :cond_0
    return-void
.end method
