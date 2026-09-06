.class public final Lcom/android/launcher3/Y4$a;
.super Ljava/lang/Object;
.source "PillColorPorovider.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/Y4;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/Y4$a;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Lcom/android/launcher3/Y4;
    .locals 1

    .line 1
    const-string p0, "context"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/android/launcher3/Y4;->c()Lcom/android/launcher3/Y4;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    new-instance p0, Lcom/android/launcher3/Y4;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/Y4;-><init>(Landroid/content/Context;Lkotlin/jvm/internal/j;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p0}, Lcom/android/launcher3/Y4;->f(Lcom/android/launcher3/Y4;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-static {}, Lcom/android/launcher3/Y4;->c()Lcom/android/launcher3/Y4;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    return-object p0
.end method
