.class Le3/a$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "CircularRevealCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le3/a;->b(Le3/d;)Landroid/animation/Animator$AnimatorListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Le3/d;


# direct methods
.method constructor <init>(Le3/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Le3/a$a;->g:Le3/d;

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
    iget-object p0, p0, Le3/a$a;->g:Le3/d;

    .line 2
    .line 3
    invoke-interface {p0}, Le3/d;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Le3/a$a;->g:Le3/d;

    .line 2
    .line 3
    invoke-interface {p0}, Le3/d;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
