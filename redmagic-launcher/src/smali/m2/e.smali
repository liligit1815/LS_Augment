.class public final synthetic Lm2/e;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lm2/e;->a:Ljava/util/ArrayList;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lm2/e;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    check-cast p1, Lz1/Z4;

    .line 4
    .line 5
    invoke-static {p0, p1}, Lm2/g;->b(Ljava/util/ArrayList;Lz1/Z4;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
