.class Landroidx/recyclerview/widget/e$g;
.super Ljava/lang/Object;
.source "DiffUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/widget/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "g"
.end annotation


# instance fields
.field a:I

.field b:I

.field c:I

.field d:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(IIII)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput p1, p0, Landroidx/recyclerview/widget/e$g;->a:I

    .line 4
    iput p2, p0, Landroidx/recyclerview/widget/e$g;->b:I

    .line 5
    iput p3, p0, Landroidx/recyclerview/widget/e$g;->c:I

    .line 6
    iput p4, p0, Landroidx/recyclerview/widget/e$g;->d:I

    return-void
.end method


# virtual methods
.method a()I
    .locals 1

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/e$g;->d:I

    .line 2
    .line 3
    iget p0, p0, Landroidx/recyclerview/widget/e$g;->c:I

    .line 4
    .line 5
    sub-int/2addr v0, p0

    .line 6
    return v0
.end method

.method b()I
    .locals 1

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/e$g;->b:I

    .line 2
    .line 3
    iget p0, p0, Landroidx/recyclerview/widget/e$g;->a:I

    .line 4
    .line 5
    sub-int/2addr v0, p0

    .line 6
    return v0
.end method
