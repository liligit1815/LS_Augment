.class Lcom/android/launcher3/UnlockAnimationProvider$a;
.super Ljava/lang/Object;
.source "UnlockAnimationProvider.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/UnlockAnimationProvider;->a(Lcom/android/launcher3/C2;Ljava/lang/String;Landroid/graphics/Point;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Ljava/lang/String;

.field final synthetic h:Lcom/android/launcher3/C2;

.field final synthetic i:Landroid/graphics/Point;

.field final synthetic j:I


# direct methods
.method constructor <init>(Lcom/android/launcher3/UnlockAnimationProvider;Ljava/lang/String;Lcom/android/launcher3/C2;Landroid/graphics/Point;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/android/launcher3/UnlockAnimationProvider$a;->g:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/android/launcher3/UnlockAnimationProvider$a;->h:Lcom/android/launcher3/C2;

    .line 4
    .line 5
    iput-object p4, p0, Lcom/android/launcher3/UnlockAnimationProvider$a;->i:Landroid/graphics/Point;

    .line 6
    .line 7
    iput p5, p0, Lcom/android/launcher3/UnlockAnimationProvider$a;->j:I

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "launcherIconAnimation: launcherOneShot: callUnlockAnimation unlockType="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/UnlockAnimationProvider$a;->g:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "UnlockAnimationProvider"

    .line 21
    .line 22
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/UnlockAnimationProvider$a;->h:Lcom/android/launcher3/C2;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lcom/android/launcher3/q4;->S()Lcom/android/launcher3/W3;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object v1, p0, Lcom/android/launcher3/UnlockAnimationProvider$a;->g:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v2, p0, Lcom/android/launcher3/UnlockAnimationProvider$a;->h:Lcom/android/launcher3/C2;

    .line 38
    .line 39
    iget-object v3, p0, Lcom/android/launcher3/UnlockAnimationProvider$a;->i:Landroid/graphics/Point;

    .line 40
    .line 41
    iget p0, p0, Lcom/android/launcher3/UnlockAnimationProvider$a;->j:I

    .line 42
    .line 43
    invoke-virtual {v0, v1, v2, v3, p0}, Lcom/android/launcher3/W3;->D(Ljava/lang/String;Lcom/android/launcher3/C2;Landroid/graphics/Point;I)V

    .line 44
    .line 45
    .line 46
    return-void
.end method
