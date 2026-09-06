.class public final synthetic Lz1/n1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Function;


# instance fields
.field public final synthetic a:Lz1/t1;


# direct methods
.method public synthetic constructor <init>(Lz1/t1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/n1;->a:Lz1/t1;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/n1;->a:Lz1/t1;

    .line 2
    .line 3
    check-cast p1, Lz1/t1$a;

    .line 4
    .line 5
    invoke-static {p0, p1}, Lz1/t1;->c(Lz1/t1;Lz1/t1$a;)Landroid/util/Pair;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
