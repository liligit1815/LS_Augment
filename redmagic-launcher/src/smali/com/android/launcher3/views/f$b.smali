.class Lcom/android/launcher3/views/f$b;
.super Landroid/view/ViewOutlineProvider;
.source "AbstractSlideInView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/views/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/views/f;


# direct methods
.method constructor <init>(Lcom/android/launcher3/views/f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/views/f$b;->a:Lcom/android/launcher3/views/f;

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
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget-object p0, p0, Lcom/android/launcher3/views/f$b;->a:Lcom/android/launcher3/views/f;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getBottomOffsetPx()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    add-int/2addr p1, p0

    .line 16
    const/4 p0, 0x0

    .line 17
    invoke-virtual {p2, p0, p0, v0, p1}, Landroid/graphics/Outline;->setRect(IIII)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
