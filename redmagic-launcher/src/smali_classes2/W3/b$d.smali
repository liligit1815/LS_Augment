.class LW3/b$d;
.super Ljava/lang/Object;
.source "BaseSinkActivity.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LW3/b;->O(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:LW3/b;


# direct methods
.method constructor <init>(LW3/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, LW3/b$d;->g:LW3/b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 2

    .line 1
    iget-object v0, p0, LW3/b$d;->g:LW3/b;

    .line 2
    .line 3
    iget-object v0, v0, LW3/b;->k:Lcom/google/android/material/appbar/AppBarLayout;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, LW3/b$d;->g:LW3/b;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-static {v0, v1}, LW3/b;->H(LW3/b;Lcom/google/android/material/appbar/AppBarLayout$Behavior$a;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, LW3/b$d;->g:LW3/b;

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    invoke-static {p0, v0}, LW3/b;->G(LW3/b;Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
