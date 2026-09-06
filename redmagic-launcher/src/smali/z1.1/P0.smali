.class public final synthetic Lz1/P0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/BiConsumer;


# instance fields
.field public final synthetic a:Lz1/R0;

.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lz1/R0;Landroid/content/Context;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/P0;->a:Lz1/R0;

    .line 5
    .line 6
    iput-object p2, p0, Lz1/P0;->b:Landroid/content/Context;

    .line 7
    .line 8
    iput-object p3, p0, Lz1/P0;->c:Ljava/util/List;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lz1/P0;->a:Lz1/R0;

    .line 2
    .line 3
    iget-object v1, p0, Lz1/P0;->b:Landroid/content/Context;

    .line 4
    .line 5
    iget-object p0, p0, Lz1/P0;->c:Ljava/util/List;

    .line 6
    .line 7
    check-cast p1, Ljava/lang/String;

    .line 8
    .line 9
    check-cast p2, Ljava/util/Set;

    .line 10
    .line 11
    invoke-static {v0, v1, p0, p1, p2}, Lz1/R0;->c(Lz1/R0;Landroid/content/Context;Ljava/util/List;Ljava/lang/String;Ljava/util/Set;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
