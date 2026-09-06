.class public final Lz1/L2$b;
.super Ljava/lang/Object;
.source "ModelInitializer.kt"

# interfaces
.implements Ls1/T$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lz1/L2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field private final g:Lcom/android/launcher3/D3;

.field private final h:Landroid/content/Context;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/D3;Landroid/content/Context;)V
    .locals 1

    .line 1
    const-string v0, "model"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "context"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lz1/L2$b;->g:Lcom/android/launcher3/D3;

    .line 15
    .line 16
    iput-object p2, p0, Lz1/L2$b;->h:Landroid/content/Context;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public dataCollection(Landroid/content/Intent;)V
    .locals 1

    .line 1
    const-string v0, "intent"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lz1/L2$b;->h:Landroid/content/Context;

    .line 7
    .line 8
    invoke-static {p0}, Lh1/c;->e(Landroid/content/Context;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onAppIconChanged(Ljava/lang/String;Landroid/os/UserHandle;)V
    .locals 1

    .line 1
    const-string v0, "packageName"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "user"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lz1/L2$b;->g:Lcom/android/launcher3/D3;

    .line 12
    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/D3;->z0(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
