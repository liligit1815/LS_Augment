.class Lcom/android/launcher3/views/SpringRelativeLayout$b;
.super Landroidx/recyclerview/widget/RecyclerView$EdgeEffectFactory;
.source "SpringRelativeLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/views/SpringRelativeLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "b"
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/views/SpringRelativeLayout;


# direct methods
.method private constructor <init>(Lcom/android/launcher3/views/SpringRelativeLayout;)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/android/launcher3/views/SpringRelativeLayout$b;->a:Lcom/android/launcher3/views/SpringRelativeLayout;

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$EdgeEffectFactory;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/views/SpringRelativeLayout;Lcom/android/launcher3/views/X;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/views/SpringRelativeLayout$b;-><init>(Lcom/android/launcher3/views/SpringRelativeLayout;)V

    return-void
.end method


# virtual methods
.method protected createEdgeEffect(Landroidx/recyclerview/widget/RecyclerView;I)Landroid/widget/EdgeEffect;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p2, v0, :cond_0

    .line 3
    .line 4
    new-instance p1, Lcom/android/launcher3/views/SpringRelativeLayout$a;

    .line 5
    .line 6
    iget-object p2, p0, Lcom/android/launcher3/views/SpringRelativeLayout$b;->a:Lcom/android/launcher3/views/SpringRelativeLayout;

    .line 7
    .line 8
    invoke-virtual {p2}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object p0, p0, Lcom/android/launcher3/views/SpringRelativeLayout$b;->a:Lcom/android/launcher3/views/SpringRelativeLayout;

    .line 13
    .line 14
    invoke-static {p0}, Lcom/android/launcher3/views/SpringRelativeLayout;->d(Lcom/android/launcher3/views/SpringRelativeLayout;)Landroid/widget/EdgeEffect;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-direct {p1, p2, v0, p0}, Lcom/android/launcher3/views/SpringRelativeLayout$a;-><init>(Lcom/android/launcher3/views/SpringRelativeLayout;Landroid/content/Context;Landroid/widget/EdgeEffect;)V

    .line 19
    .line 20
    .line 21
    return-object p1

    .line 22
    :cond_0
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$EdgeEffectFactory;->createEdgeEffect(Landroidx/recyclerview/widget/RecyclerView;I)Landroid/widget/EdgeEffect;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method
