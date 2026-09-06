.class public final synthetic LD1/r;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/BiConsumer;


# instance fields
.field public final synthetic a:LD1/t;

.field public final synthetic b:Ljava/util/Map;


# direct methods
.method public synthetic constructor <init>(LD1/t;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LD1/r;->a:LD1/t;

    .line 5
    .line 6
    iput-object p2, p0, LD1/r;->b:Ljava/util/Map;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, LD1/r;->a:LD1/t;

    .line 2
    .line 3
    iget-object p0, p0, LD1/r;->b:Ljava/util/Map;

    .line 4
    .line 5
    check-cast p1, Landroid/os/UserHandle;

    .line 6
    .line 7
    check-cast p2, Lcom/android/launcher3/util/N2;

    .line 8
    .line 9
    invoke-static {v0, p0, p1, p2}, LD1/t;->a(LD1/t;Ljava/util/Map;Landroid/os/UserHandle;Lcom/android/launcher3/util/N2;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
