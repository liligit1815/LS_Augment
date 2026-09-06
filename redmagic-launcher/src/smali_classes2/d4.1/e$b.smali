.class public Ld4/e$b;
.super Ljava/lang/Object;
.source "RecyclerViewOverScrollDecorAdapter.java"

# interfaces
.implements Ld4/e$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ld4/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "b"
.end annotation


# instance fields
.field final synthetic a:Ld4/e;


# direct methods
.method protected constructor <init>(Ld4/e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ld4/e$b;->a:Ld4/e;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ld4/e$b;->a:Ld4/e;

    .line 2
    .line 3
    iget-object p0, p0, Ld4/e;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->canScrollHorizontally(I)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    xor-int/2addr p0, v0

    .line 11
    return p0
.end method

.method public b()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ld4/e$b;->a:Ld4/e;

    .line 2
    .line 3
    iget-object p0, p0, Ld4/e;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 4
    .line 5
    const/4 v0, -0x1

    .line 6
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->canScrollHorizontally(I)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    xor-int/lit8 p0, p0, 0x1

    .line 11
    .line 12
    return p0
.end method
