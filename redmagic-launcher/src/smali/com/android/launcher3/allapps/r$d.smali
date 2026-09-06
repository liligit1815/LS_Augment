.class Lcom/android/launcher3/allapps/r$d;
.super Ljava/lang/Object;
.source "ActivityAllAppsContainerView.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/allapps/r;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/allapps/r;


# direct methods
.method constructor <init>(Lcom/android/launcher3/allapps/r;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/r$d;->g:Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/allapps/r$d;->g:Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/allapps/r;->B(Lcom/android/launcher3/allapps/r;)Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/launcher3/allapps/r$d;->g:Lcom/android/launcher3/allapps/r;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/android/launcher3/allapps/r;->B(Lcom/android/launcher3/allapps/r;)Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1, p0}, Landroid/widget/LinearLayout;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/launcher3/allapps/r$d;->g:Lcom/android/launcher3/allapps/r;

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-static {p0, p1}, Lcom/android/launcher3/allapps/r;->C(Lcom/android/launcher3/allapps/r;Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method
