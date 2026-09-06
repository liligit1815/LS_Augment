.class LK1/h$c;
.super Landroid/animation/AnimatorListenerAdapter;
.source "PreferenceHighlighter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LK1/h;->e()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:LK1/h;


# direct methods
.method constructor <init>(LK1/h;)V
    .locals 0

    .line 1
    iput-object p1, p0, LK1/h$c;->g:LK1/h;

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
    iget-object p1, p0, LK1/h$c;->g:LK1/h;

    .line 2
    .line 3
    invoke-static {p1}, LK1/h;->b(LK1/h;)Landroidx/recyclerview/widget/RecyclerView;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, LK1/h$c;->g:LK1/h;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->removeItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
