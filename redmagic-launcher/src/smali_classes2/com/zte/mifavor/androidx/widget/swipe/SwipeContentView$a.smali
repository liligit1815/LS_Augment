.class Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView$a;
.super Landroid/view/ViewOutlineProvider;
.source "SwipeContentView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView$a;->a:Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v3

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v4

    .line 9
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView$a;->a:Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/high16 p1, 0x41800000    # 16.0f

    .line 16
    .line 17
    invoke-static {p0, p1}, Lb4/h;->c(Landroid/content/Context;F)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    int-to-float v5, p0

    .line 22
    const/4 v1, 0x0

    .line 23
    const/4 v2, 0x0

    .line 24
    move-object v0, p2

    .line 25
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Outline;->setRoundRect(IIIIF)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
