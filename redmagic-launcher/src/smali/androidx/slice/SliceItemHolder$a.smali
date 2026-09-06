.class public Landroidx/slice/SliceItemHolder$a;
.super Ljava/lang/Object;
.source "SliceItemHolder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/slice/SliceItemHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field private final a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/slice/SliceItemHolder;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Landroidx/slice/SliceItemHolder$a;->a:Ljava/util/ArrayList;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a()Landroidx/slice/SliceItemHolder;
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/slice/SliceItemHolder$a;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Landroidx/slice/SliceItemHolder$a;->a:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/lit8 v0, v0, -0x1

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Landroidx/slice/SliceItemHolder;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    new-instance v0, Landroidx/slice/SliceItemHolder;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Landroidx/slice/SliceItemHolder;-><init>(Landroidx/slice/SliceItemHolder$a;)V

    .line 27
    .line 28
    .line 29
    return-object v0
.end method

.method public b(Landroidx/slice/SliceItemHolder;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p1, Landroidx/slice/SliceItemHolder;->b:Landroid/os/Parcelable;

    .line 3
    .line 4
    iput-object v0, p1, Landroidx/slice/SliceItemHolder;->c:Ljava/lang/Object;

    .line 5
    .line 6
    iput-object v0, p1, Landroidx/slice/SliceItemHolder;->a:Ll0/a;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    iput v1, p1, Landroidx/slice/SliceItemHolder;->e:I

    .line 10
    .line 11
    const-wide/16 v1, 0x0

    .line 12
    .line 13
    iput-wide v1, p1, Landroidx/slice/SliceItemHolder;->f:J

    .line 14
    .line 15
    iput-object v0, p1, Landroidx/slice/SliceItemHolder;->d:Ljava/lang/String;

    .line 16
    .line 17
    iget-object p0, p0, Landroidx/slice/SliceItemHolder$a;->a:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method
