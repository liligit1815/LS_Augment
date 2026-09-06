.class public final synthetic Lcom/android/quickstep/util/h0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Ljava/util/function/Supplier;

.field public final synthetic h:Ljava/lang/String;

.field public final synthetic i:Landroid/content/Context;

.field public final synthetic j:Landroid/graphics/Rect;

.field public final synthetic k:Landroid/content/Intent;


# direct methods
.method public synthetic constructor <init>(Ljava/util/function/Supplier;Ljava/lang/String;Landroid/content/Context;Landroid/graphics/Rect;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/h0;->g:Ljava/util/function/Supplier;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/util/h0;->h:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/util/h0;->i:Landroid/content/Context;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/quickstep/util/h0;->j:Landroid/graphics/Rect;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/android/quickstep/util/h0;->k:Landroid/content/Intent;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/h0;->g:Ljava/util/function/Supplier;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/util/h0;->h:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/quickstep/util/h0;->i:Landroid/content/Context;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/quickstep/util/h0;->j:Landroid/graphics/Rect;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/util/h0;->k:Landroid/content/Intent;

    .line 10
    .line 11
    invoke-static {v0, v1, v2, v3, p0}, Lcom/android/quickstep/util/ImageActionUtils;->d(Ljava/util/function/Supplier;Ljava/lang/String;Landroid/content/Context;Landroid/graphics/Rect;Landroid/content/Intent;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
