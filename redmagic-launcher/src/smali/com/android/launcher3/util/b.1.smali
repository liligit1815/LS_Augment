.class public Lcom/android/launcher3/util/b;
.super Ljava/lang/Object;
.source "ActivityOptionsWrapper.java"


# instance fields
.field public final a:Landroid/app/ActivityOptions;

.field public final b:Lcom/android/launcher3/util/Y1;


# direct methods
.method public constructor <init>(Landroid/app/ActivityOptions;Lcom/android/launcher3/util/Y1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/util/b;->b:Lcom/android/launcher3/util/Y1;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
