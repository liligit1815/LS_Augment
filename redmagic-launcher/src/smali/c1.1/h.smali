.class public final synthetic Lc1/h;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Supplier;


# instance fields
.field public final synthetic a:Lc1/j;

.field public final synthetic b:Lc1/q;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lc1/j;Lc1/q;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lc1/h;->a:Lc1/j;

    .line 5
    .line 6
    iput-object p2, p0, Lc1/h;->b:Lc1/q;

    .line 7
    .line 8
    iput-boolean p3, p0, Lc1/h;->c:Z

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Lc1/h;->a:Lc1/j;

    .line 2
    .line 3
    iget-object v1, p0, Lc1/h;->b:Lc1/q;

    .line 4
    .line 5
    iget-boolean p0, p0, Lc1/h;->c:Z

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lc1/j;->x(Lc1/j;Lc1/q;Z)Lc1/e;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
