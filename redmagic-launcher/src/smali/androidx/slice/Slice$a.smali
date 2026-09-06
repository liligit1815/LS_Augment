.class public Landroidx/slice/Slice$a;
.super Ljava/lang/Object;
.source "Slice.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/slice/Slice;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field private final a:Landroid/net/Uri;

.field private b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/slice/SliceItem;",
            ">;"
        }
    .end annotation
.end field

.field private c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private d:Landroidx/slice/SliceSpec;


# direct methods
.method public constructor <init>(Landroid/net/Uri;)V
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
    iput-object v0, p0, Landroidx/slice/Slice$a;->b:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Landroidx/slice/Slice$a;->c:Ljava/util/ArrayList;

    .line 17
    .line 18
    iput-object p1, p0, Landroidx/slice/Slice$a;->a:Landroid/net/Uri;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public a()Landroidx/slice/Slice;
    .locals 4

    .line 1
    new-instance v0, Landroidx/slice/Slice;

    .line 2
    .line 3
    iget-object v1, p0, Landroidx/slice/Slice$a;->b:Ljava/util/ArrayList;

    .line 4
    .line 5
    iget-object v2, p0, Landroidx/slice/Slice$a;->c:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    new-array v3, v3, [Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, [Ljava/lang/String;

    .line 18
    .line 19
    iget-object v3, p0, Landroidx/slice/Slice$a;->a:Landroid/net/Uri;

    .line 20
    .line 21
    iget-object p0, p0, Landroidx/slice/Slice$a;->d:Landroidx/slice/SliceSpec;

    .line 22
    .line 23
    invoke-direct {v0, v1, v2, v3, p0}, Landroidx/slice/Slice;-><init>(Ljava/util/ArrayList;[Ljava/lang/String;Landroid/net/Uri;Landroidx/slice/SliceSpec;)V

    .line 24
    .line 25
    .line 26
    return-object v0
.end method
