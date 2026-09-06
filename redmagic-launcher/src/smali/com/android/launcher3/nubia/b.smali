.class public final synthetic Lcom/android/launcher3/nubia/b;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/launcher3/util/Y0$a;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/nubia/NubiaPushConfig;

.field public final synthetic b:Lcom/android/launcher3/C2;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/nubia/NubiaPushConfig;Lcom/android/launcher3/C2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/nubia/b;->a:Lcom/android/launcher3/nubia/NubiaPushConfig;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/nubia/b;->b:Lcom/android/launcher3/C2;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/nubia/b;->a:Lcom/android/launcher3/nubia/NubiaPushConfig;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/nubia/b;->b:Lcom/android/launcher3/C2;

    .line 4
    .line 5
    invoke-static {v0, p0, p1, p2}, Lcom/android/launcher3/nubia/c;->a(Lcom/android/launcher3/nubia/NubiaPushConfig;Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
