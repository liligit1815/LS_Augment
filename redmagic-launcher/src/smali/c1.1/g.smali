.class public final synthetic Lc1/g;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Supplier;


# instance fields
.field public final synthetic a:Lc1/j;

.field public final synthetic b:Lc1/q;


# direct methods
.method public synthetic constructor <init>(Lc1/j;Lc1/q;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lc1/g;->a:Lc1/j;

    .line 5
    .line 6
    iput-object p2, p0, Lc1/g;->b:Lc1/q;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lc1/g;->a:Lc1/j;

    .line 2
    .line 3
    iget-object p0, p0, Lc1/g;->b:Lc1/q;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lc1/j;->u(Lc1/j;Lc1/q;)Lc1/e;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
