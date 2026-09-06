.class public final synthetic Lz1/m0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/H5;

.field public final synthetic b:Landroid/os/UserHandle;

.field public final synthetic c:Landroid/content/Context;

.field public final synthetic d:Ljava/util/Map;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/H5;Landroid/os/UserHandle;Landroid/content/Context;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/m0;->a:Lcom/android/launcher3/H5;

    .line 5
    .line 6
    iput-object p2, p0, Lz1/m0;->b:Landroid/os/UserHandle;

    .line 7
    .line 8
    iput-object p3, p0, Lz1/m0;->c:Landroid/content/Context;

    .line 9
    .line 10
    iput-object p4, p0, Lz1/m0;->d:Ljava/util/Map;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lz1/m0;->a:Lcom/android/launcher3/H5;

    .line 2
    .line 3
    iget-object v1, p0, Lz1/m0;->b:Landroid/os/UserHandle;

    .line 4
    .line 5
    iget-object v2, p0, Lz1/m0;->c:Landroid/content/Context;

    .line 6
    .line 7
    iget-object p0, p0, Lz1/m0;->d:Ljava/util/Map;

    .line 8
    .line 9
    check-cast p1, Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0, v1, v2, p0, p1}, Lz1/y0;->b(Lcom/android/launcher3/H5;Landroid/os/UserHandle;Landroid/content/Context;Ljava/util/Map;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
