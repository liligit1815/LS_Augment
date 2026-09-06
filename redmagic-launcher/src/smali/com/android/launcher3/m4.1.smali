.class public final synthetic Lcom/android/launcher3/m4;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/q4;

.field public final synthetic h:Landroid/graphics/Bitmap;

.field public final synthetic i:Lcom/android/launcher3/C2;

.field public final synthetic j:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/q4;Landroid/graphics/Bitmap;Lcom/android/launcher3/C2;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/m4;->g:Lcom/android/launcher3/q4;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/m4;->h:Landroid/graphics/Bitmap;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/m4;->i:Lcom/android/launcher3/C2;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/launcher3/m4;->j:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/m4;->g:Lcom/android/launcher3/q4;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/m4;->h:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/m4;->i:Lcom/android/launcher3/C2;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/m4;->j:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, Lcom/android/launcher3/q4;->z(Lcom/android/launcher3/q4;Landroid/graphics/Bitmap;Lcom/android/launcher3/C2;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
