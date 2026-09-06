.class public final synthetic Lcom/android/launcher3/util/T;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/util/Z;

.field public final synthetic h:Landroid/content/Context;

.field public final synthetic i:Landroid/content/res/Configuration;

.field public final synthetic j:Lcom/android/launcher3/util/Z$c;

.field public final synthetic k:Lcom/android/launcher3/util/Z$d;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/util/Z;Landroid/content/Context;Landroid/content/res/Configuration;Lcom/android/launcher3/util/Z$c;Lcom/android/launcher3/util/Z$d;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/util/T;->g:Lcom/android/launcher3/util/Z;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/util/T;->h:Landroid/content/Context;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/util/T;->i:Landroid/content/res/Configuration;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/launcher3/util/T;->j:Lcom/android/launcher3/util/Z$c;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/android/launcher3/util/T;->k:Lcom/android/launcher3/util/Z$d;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/T;->g:Lcom/android/launcher3/util/Z;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/util/T;->h:Landroid/content/Context;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/util/T;->i:Landroid/content/res/Configuration;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/launcher3/util/T;->j:Lcom/android/launcher3/util/Z$c;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/util/T;->k:Lcom/android/launcher3/util/Z$d;

    .line 10
    .line 11
    invoke-static {v0, v1, v2, v3, p0}, Lcom/android/launcher3/util/Z;->a(Lcom/android/launcher3/util/Z;Landroid/content/Context;Landroid/content/res/Configuration;Lcom/android/launcher3/util/Z$c;Lcom/android/launcher3/util/Z$d;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
