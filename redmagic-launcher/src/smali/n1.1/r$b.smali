.class Ln1/r$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "PreloadIconDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ln1/r;->D(FZLjava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Ln1/r;


# direct methods
.method constructor <init>(Ln1/r;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ln1/r$b;->g:Ln1/r;

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
    iget-object p0, p0, Ln1/r$b;->g:Ln1/r;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-static {p0, p1}, Ln1/r;->w(Ln1/r;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
