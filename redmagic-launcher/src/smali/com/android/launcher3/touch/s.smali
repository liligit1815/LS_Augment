.class public final synthetic Lcom/android/launcher3/touch/s;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/C2;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Lcom/android/launcher3/model/data/y;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/C2;Landroid/view/View;Lcom/android/launcher3/model/data/y;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/touch/s;->a:Lcom/android/launcher3/C2;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/touch/s;->b:Landroid/view/View;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/touch/s;->c:Lcom/android/launcher3/model/data/y;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/launcher3/touch/s;->d:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/touch/s;->a:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/touch/s;->b:Landroid/view/View;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/touch/s;->c:Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/touch/s;->d:Ljava/lang/String;

    .line 8
    .line 9
    check-cast p1, Landroid/content/pm/PackageInstaller$SessionInfo;

    .line 10
    .line 11
    invoke-static {v0, v1, v2, p0, p1}, Lcom/android/launcher3/touch/v;->g(Lcom/android/launcher3/C2;Landroid/view/View;Lcom/android/launcher3/model/data/y;Ljava/lang/String;Landroid/content/pm/PackageInstaller$SessionInfo;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
