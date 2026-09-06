.class LP2/d$b;
.super Ljava/lang/Object;
.source "RegionSamplingHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LP2/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:LP2/d;


# direct methods
.method constructor <init>(LP2/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, LP2/d$b;->g:LP2/d;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, LP2/d$b;->g:LP2/d;

    .line 2
    .line 3
    invoke-static {v0}, LP2/d;->e(LP2/d;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object p0, p0, LP2/d$b;->g:LP2/d;

    .line 12
    .line 13
    invoke-static {p0}, LP2/d;->g(LP2/d;)Landroid/view/ViewTreeObserver$OnDrawListener;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnDrawListener(Landroid/view/ViewTreeObserver$OnDrawListener;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
