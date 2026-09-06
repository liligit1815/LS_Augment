.class LP1/h$c;
.super Landroid/animation/AnimatorListenerAdapter;
.source "DepthController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LP1/h;->onMultiWindowModeChanged(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:LP1/h;


# direct methods
.method constructor <init>(LP1/h;)V
    .locals 0

    .line 1
    iput-object p1, p0, LP1/h$c;->g:LP1/h;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, LP1/h$c;->g:LP1/h;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-static {p0, p1}, LP1/h;->h(LP1/h;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
