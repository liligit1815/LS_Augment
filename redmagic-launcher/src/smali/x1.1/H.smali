.class public final synthetic Lx1/H;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public final synthetic a:Ljava/util/Set;

.field public final synthetic b:Ljava/util/function/Function;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Set;Ljava/util/function/Function;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lx1/H;->a:Ljava/util/Set;

    .line 5
    .line 6
    iput-object p2, p0, Lx1/H;->b:Ljava/util/function/Function;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lx1/H;->a:Ljava/util/Set;

    .line 2
    .line 3
    iget-object p0, p0, Lx1/H;->b:Ljava/util/function/Function;

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, Lx1/O;->j(Ljava/util/Set;Ljava/util/function/Function;Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
