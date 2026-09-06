.class public Ld4/b;
.super Ljava/lang/Object;
.source "HorizontalScrollViewOverScrollDecorAdapter.java"

# interfaces
.implements Ld4/c;


# instance fields
.field protected final a:Landroid/widget/HorizontalScrollView;


# direct methods
.method public constructor <init>(Landroid/widget/HorizontalScrollView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ld4/b;->a:Landroid/widget/HorizontalScrollView;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ld4/b;->a:Landroid/widget/HorizontalScrollView;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/HorizontalScrollView;->canScrollHorizontally(I)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    xor-int/2addr p0, v0

    .line 9
    return p0
.end method

.method public b()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ld4/b;->a:Landroid/widget/HorizontalScrollView;

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/HorizontalScrollView;->canScrollHorizontally(I)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    xor-int/lit8 p0, p0, 0x1

    .line 9
    .line 10
    return p0
.end method

.method public c()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ld4/b;->a:Landroid/widget/HorizontalScrollView;

    .line 2
    .line 3
    return-object p0
.end method
