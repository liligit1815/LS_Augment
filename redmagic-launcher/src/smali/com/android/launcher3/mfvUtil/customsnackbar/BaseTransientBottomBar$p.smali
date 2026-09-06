.class Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$p;
.super Ljava/lang/Object;
.source "BaseTransientBottomBar.java"

# interfaces
.implements Lcom/google/android/material/behavior/SwipeDismissBehavior$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->L(Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;


# direct methods
.method constructor <init>(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$p;->a:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;)V
    .locals 1

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$p;->a:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->t(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public b(I)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p1, v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p1, v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {}, Lcom/android/launcher3/mfvUtil/customsnackbar/b;->c()Lcom/android/launcher3/mfvUtil/customsnackbar/b;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$p;->a:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->r:Lcom/android/launcher3/mfvUtil/customsnackbar/b$b;

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/b;->j(Lcom/android/launcher3/mfvUtil/customsnackbar/b$b;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    invoke-static {}, Lcom/android/launcher3/mfvUtil/customsnackbar/b;->c()Lcom/android/launcher3/mfvUtil/customsnackbar/b;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$p;->a:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->r:Lcom/android/launcher3/mfvUtil/customsnackbar/b$b;

    .line 29
    .line 30
    invoke-virtual {p1, p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/b;->k(Lcom/android/launcher3/mfvUtil/customsnackbar/b$b;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method
