.class public Lv1/b;
.super Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;
.source "FocusedItemDecorator.java"


# instance fields
.field private g:Lv1/a;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;-><init>()V

    .line 2
    new-instance v0, Lv1/a$a;

    invoke-direct {v0, p1}, Lv1/a$a;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lv1/b;->g:Lv1/a;

    return-void
.end method

.method public constructor <init>(Lv1/a;)V
    .locals 0

    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;-><init>()V

    .line 4
    iput-object p1, p0, Lv1/b;->g:Lv1/a;

    return-void
.end method


# virtual methods
.method public a()Landroid/view/View$OnFocusChangeListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lv1/b;->g:Lv1/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public onDrawOver(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv1/b;->g:Lv1/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/keyboard/a;->e(Landroid/graphics/Canvas;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
