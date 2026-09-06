.class Ll3/e$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "MaterialBottomContainerBackHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll3/e;->h(Landroidx/activity/b;Landroid/animation/Animator$AnimatorListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Ll3/e;


# direct methods
.method constructor <init>(Ll3/e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll3/e$a;->g:Ll3/e;

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
    .locals 1

    .line 1
    iget-object p1, p0, Ll3/e$a;->g:Ll3/e;

    .line 2
    .line 3
    iget-object p1, p1, Ll3/a;->b:Landroid/view/View;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll3/e$a;->g:Ll3/e;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll3/e;->k(F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
