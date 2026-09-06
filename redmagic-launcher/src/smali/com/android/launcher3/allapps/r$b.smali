.class Lcom/android/launcher3/allapps/r$b;
.super Landroid/view/ViewOutlineProvider;
.source "ActivityAllAppsContainerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/allapps/r;->r0(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/allapps/r;


# direct methods
.method constructor <init>(Lcom/android/launcher3/allapps/r;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/r$b;->a:Lcom/android/launcher3/allapps/r;

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
    iget-object p0, p0, Lcom/android/launcher3/allapps/r$b;->a:Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getMeasuredHeight()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    int-to-float p0, p0

    .line 8
    const v0, 0x3f666666    # 0.9f

    .line 9
    .line 10
    .line 11
    mul-float/2addr p0, v0

    .line 12
    float-to-int p0, p0

    .line 13
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    add-int/2addr p1, p0

    .line 22
    const/4 p0, 0x0

    .line 23
    invoke-virtual {p2, p0, p0, v0, p1}, Landroid/graphics/Outline;->setRect(IIII)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
