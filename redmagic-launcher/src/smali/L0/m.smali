.class public final synthetic LL0/m;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Function;


# instance fields
.field public final synthetic a:LL0/n$a;

.field public final synthetic b:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(LL0/n$a;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LL0/m;->a:LL0/n$a;

    .line 5
    .line 6
    iput-object p2, p0, LL0/m;->b:Ljava/util/ArrayList;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, LL0/m;->a:LL0/n$a;

    .line 2
    .line 3
    iget-object p0, p0, LL0/m;->b:Ljava/util/ArrayList;

    .line 4
    .line 5
    check-cast p1, LL0/n$c;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, LL0/n;->d(LL0/n$a;Ljava/util/ArrayList;LL0/n$c;)LM0/d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
