.class public final Lcom/android/quickstep/views/DesktopTaskContentView;
.super Landroid/widget/FrameLayout;
.source "DesktopTaskContentView.kt"


# instance fields
.field private final bounds:Landroid/graphics/Rect;

.field private cornerRadius:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-direct {p0, p1, v0, v1, v0}, Lcom/android/quickstep/views/DesktopTaskContentView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 3
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 4
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/android/quickstep/views/DesktopTaskContentView;->bounds:Landroid/graphics/Rect;

    const/4 p1, 0x1

    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setClipToOutline(Z)V

    .line 6
    new-instance p1, Lcom/android/quickstep/views/DesktopTaskContentView$1;

    invoke-direct {p1, p0}, Lcom/android/quickstep/views/DesktopTaskContentView$1;-><init>(Lcom/android/quickstep/views/DesktopTaskContentView;)V

    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/j;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 2
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/views/DesktopTaskContentView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static final synthetic access$getBounds$p(Lcom/android/quickstep/views/DesktopTaskContentView;)Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/DesktopTaskContentView;->bounds:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final getCornerRadius()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/DesktopTaskContentView;->cornerRadius:F

    .line 2
    .line 3
    return p0
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    iget-object p3, p0, Lcom/android/quickstep/views/DesktopTaskContentView;->bounds:Landroid/graphics/Rect;

    .line 5
    .line 6
    const/4 p4, 0x0

    .line 7
    invoke-virtual {p3, p4, p4, p1, p2}, Landroid/graphics/Rect;->set(IIII)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidateOutline()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final setCornerRadius(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/views/DesktopTaskContentView;->cornerRadius:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidateOutline()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
