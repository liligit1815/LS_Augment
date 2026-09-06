.class public final synthetic Lz1/v4;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/IntPredicate;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/v4;->a:Ljava/util/List;

    .line 5
    .line 6
    iput-object p2, p0, Lz1/v4;->b:Ljava/util/List;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final test(I)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lz1/v4;->a:Ljava/util/List;

    .line 2
    .line 3
    iget-object p0, p0, Lz1/v4;->b:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, Lz1/w4$a;->a(Ljava/util/List;Ljava/util/List;I)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
