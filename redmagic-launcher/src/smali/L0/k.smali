.class public final synthetic LL0/k;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Supplier;


# instance fields
.field public final synthetic a:LL0/n;

.field public final synthetic b:Ljava/util/function/Predicate;


# direct methods
.method public synthetic constructor <init>(LL0/n;Ljava/util/function/Predicate;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LL0/k;->a:LL0/n;

    .line 5
    .line 6
    iput-object p2, p0, LL0/k;->b:Ljava/util/function/Predicate;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, LL0/k;->a:LL0/n;

    .line 2
    .line 3
    iget-object p0, p0, LL0/k;->b:Ljava/util/function/Predicate;

    .line 4
    .line 5
    invoke-static {v0, p0}, LL0/n;->e(LL0/n;Ljava/util/function/Predicate;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
