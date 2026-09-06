.class Lcom/android/launcher3/helper/a$a;
.super Ljava/lang/Object;
.source "LauncherHelper.java"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/helper/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/helper/a;


# direct methods
.method constructor <init>(Lcom/android/launcher3/helper/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/helper/a$a;->g:Lcom/android/launcher3/helper/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(IFI)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/android/launcher3/helper/a$a;->g:Lcom/android/launcher3/helper/a;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/android/launcher3/helper/a;->d(Lcom/android/launcher3/helper/a;)Lcom/android/launcher3/helper/DotsPageIndicatorZTE;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-nez p2, :cond_0

    .line 12
    .line 13
    iget-object p2, p0, Lcom/android/launcher3/helper/a$a;->g:Lcom/android/launcher3/helper/a;

    .line 14
    .line 15
    invoke-static {p2}, Lcom/android/launcher3/helper/a;->d(Lcom/android/launcher3/helper/a;)Lcom/android/launcher3/helper/DotsPageIndicatorZTE;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p2, p1}, Lcom/android/launcher3/helper/DotsPageIndicatorZTE;->setActiveMarker(I)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/launcher3/helper/a$a;->g:Lcom/android/launcher3/helper/a;

    .line 23
    .line 24
    invoke-static {p0}, Lcom/android/launcher3/helper/a;->d(Lcom/android/launcher3/helper/a;)Lcom/android/launcher3/helper/DotsPageIndicatorZTE;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const/4 p2, 0x1

    .line 29
    invoke-virtual {p0, p2, p3, p1}, Lcom/android/launcher3/helper/DotsPageIndicatorZTE;->k(ZII)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public b(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(I)V
    .locals 0

    .line 1
    return-void
.end method
