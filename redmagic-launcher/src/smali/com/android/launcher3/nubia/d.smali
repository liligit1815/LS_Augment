.class public final synthetic Lcom/android/launcher3/nubia/d;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/launcher3/util/Y0$a;


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:[Z

.field public final synthetic c:Lcom/android/launcher3/C2;

.field public final synthetic d:Lcom/android/launcher3/nubia/NubiaPushConfig;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;[ZLcom/android/launcher3/C2;Lcom/android/launcher3/nubia/NubiaPushConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/nubia/d;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/nubia/d;->b:[Z

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/nubia/d;->c:Lcom/android/launcher3/C2;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/launcher3/nubia/d;->d:Lcom/android/launcher3/nubia/NubiaPushConfig;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final a(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/nubia/d;->a:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/nubia/d;->b:[Z

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/nubia/d;->c:Lcom/android/launcher3/C2;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/launcher3/nubia/d;->d:Lcom/android/launcher3/nubia/NubiaPushConfig;

    .line 8
    .line 9
    move-object v4, p1

    .line 10
    move-object v5, p2

    .line 11
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/nubia/c$b;->a(Landroid/content/Context;[ZLcom/android/launcher3/C2;Lcom/android/launcher3/nubia/NubiaPushConfig;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method
